import typing
import os

from pathlib import Path
import tqdm

from sql import sql_parser, database


def load_sql(path, db: typing.Optional[database.Postgres] = None, verbose=False):
    files = []
    for parent, dirnames, filenames in os.walk(path):
        parent = Path(parent).absolute()
        for file in filenames:
            file = parent / file
            if file.suffix == '.sql':
                files.append(file)
    if verbose:
        files = tqdm.tqdm(files, desc='Loading SQLs')
    if db and hasattr(db, 'schema'):
        env = sql_parser.ParserEnvironment()
        env.table_columns = db.schema.table_columns
    else:
        env = None
    res = []
    for file in files:
        with open(file, 'r') as f:
            sql = f.read()
            sql = sql_parser.parse_select(sql, env)
            sql.filename = file
            res.append(sql)
    return res
