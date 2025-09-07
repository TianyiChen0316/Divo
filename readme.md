# Divo

## Training

To run the training process of Divo, please use the following command.

```shell
python main.py (-d | --dataset [path]) (-e [num_epochs]) (-F | --id [experiment_id]) \
    (--warm-up [num_iterations]) (-S | --seed [seed]) (-D | --database [dbname]) \
    (-U | --user [dbuser]) (-P | --password [dbpasswd]) (--port [dbport]) (--host [dbhost]) \
    (--server-name [server_hostname]) (--timeout [timeout]) (--experiences [checkpoint_path])
```

- `-d | --dataset`: The path of datasets (relative to `[project root]/Divo`).
- `-e`: The total number of epochs.
- `-F | --id`: The experiment name. This argument sets the names of result files and checkpoints.
- `--warm-up`: When provided, warming up the database before running by iteratively executing queries in the dataset.
- `-S | --seed`: The random seed.
- `-D | --database`: The PostgreSQL database name. We use `-D` as `-d` is occupied by datasets,
- `-U | --user`: The PostgreSQL user name. The user should have login and read permissions.
- `-P | --password`: The PostgreSQL user password. Can be omitted when the user requires no password.
- `--port`: The PostgreSQL port. The default value is `5432`.
- `--host`: The PostgreSQL server host. Can be omitted when PostgreSQL is running on the local machine.
- `--server-name`: The hostname of the current machine. This argument specifies the execution latency cache storage. When omitted, Divo will use the current host name on the machine.
- `--timeout`: The maximal timeout limit of query execution.
- `--experiences`: When provided, Divo will use the static experiences from the checkpoint.

## Query generation

Divo provides a query generator to generate diverse queries rapidly. Please follow the instructions below to run the query generator.

```shell 
python main.py sql_augment [output_path] (-d | --dataset [path]) (-F | --id [experiment_id]) \
    (--warm-up [num_iterations]) (-S | --seed [seed]) (-D | --database [dbname]) \
    (-U | --user [dbuser]) (-P | --password [dbpasswd]) (--port [dbport]) (--host [dbhost]) \
    (--output-prefix [prefix]) (--filter-dataset [path]) (--total-size [1000]) \
    (--batch-size [100]) (--max-retries [1000]) (--replace-filter [0.25]) \
    (--timeout [timeout]) (--least-latency [latency]) (--reuse-generated) \
    (--explain) (--check-duplicates)
```

- `output_path`: The output path of generated queries (relative to `[project root]/Divo`).
- `--output-prefix`: The prefix of output SQL files.
- `--filter-dataset`: The datasets that provide filter predicates.
- `--total-size`: The number of queries to generate.
- `--batch-size`: The number of queries to generate in a row. This parameter does not influence the algorithm, but SQL files will be written as a batch.
- `--max-retries`: The retry limit of each batch.
- `--replace-filter`: The probability of replacing each filter with a new one of the same category.
- `--timeout`: The highest latency of generated queries. Queries with an exceeded latency will be discarded.
- `--least-latency`: The lowest latency of generated queries. Queries with a latency less than this value will be discarded.
- `--reuse-generated`: To reuse the generated queries as new sources for generation. Recommended.
- `--explain`: To use explain to ensure validity instead of executing. When specified, timeout settings are no longer applied.
- `--check-duplicates`: To check and remove duplicated queries. Recommended.

## Experience collection

The following commands collect static experiences and assign sampling weights.

```shell
python main.py collect_experiences (-d | --dataset [path]) (-e [num_epochs]) (-F | --id [experiment_id]) \
    (--warm-up [num_iterations]) (-S | --seed [seed]) (-D | --database [dbname]) \
    (-U | --user [dbuser]) (-P | --password [dbpasswd]) (--port [dbport]) (--host [dbhost]) \
    (--timeout [timeout]) (--chunk-size [100]) (--chunk-switch-epoch [40])
```

- `--chunk-size`: The number of queries to be explored together as a subset.
- `--chunk-switch-epoch`: The number of epochs to switch to the next chunk.

After the collection, we adopt [DoReMi][1] to obtain sampling weights for each workload (generated queries, JOB, DSB, etc.) with the command below. The output checkpoint can be used as static experiences thereafter.

```shell
python main.py doremi (-d | --dataset [path]) (-e [num_epochs]) (-F | --id [experiment_id]) \
    (--warm-up [num_iterations]) (-S | --seed [seed]) (-D | --database [dbname]) \
    (-U | --user [dbuser]) (-P | --password [dbpasswd]) (--port [dbport]) (--host [dbhost]) \
    (--reference-iterations [500]) (--proxy-iterations [2000])
```

- `--reference-iterations`: The iterations of training the reference model.
- `--proxy-iterations`: The iterations of training the proxy model.



[1]: Sang Michael Xie, Hieu Pham, Xuanyi Dong, Nan Du, Hanxiao Liu, Yifeng Lu, Percy Liang, Quoc VLe, Tengyu Ma, and Adams Wei Yu. Doremi: Optimizing data mixtures speeds up language model pretraining. In Thirty-seventh Conference on Neural Information Processing Systems, 2023.