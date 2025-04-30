from lib.tools import ModulePacker

module_packer = ModulePacker({
    None: 'LLQO.train_scripts.train_with_bucket_memory',
}, entry_name='main')

if __name__ == '__main__':
    module_packer()
