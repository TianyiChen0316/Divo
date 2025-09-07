from lib.tools import ModulePacker

module_packer = ModulePacker({
    None: 'Divo.train_scripts.train_with_bucket_memory',

    'collect_experiences': 'Divo.train_scripts.collect_experiences',
    'doremi': 'Divo.train_scripts.doremi',
    'sql_augment': 'Divo.train_scripts.sql_augment',
}, entry_name='main')

if __name__ == '__main__':
    module_packer()
