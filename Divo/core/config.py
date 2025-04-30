from lib.tools.config import Config as BaseConfig

class Config(BaseConfig):
    log_stdout = True

    feature_size = 64
    feature_length = 2
    feature_extra_length = 7
    embedding_size = 64

    use_lstm = False

    max_sequence_length = 36
    plan_use_node_attrs = True
    plan_use_leaf_node_attrs = True
    plan_use_leaf_node_attrs_with_sql_info = True
    plan_use_branch_node_attrs = True
    plan_attach_node_attrs_before_selection = False
    plan_relative_dist_maximum = 8
    plan_use_height = False
    plan_height_maximum = 8
    plan_aggr_node_bidirectional = False
    plan_aggr_node_link_to_root_nodes_only = False
    plan_aggr_node_relative_dist_type = 'height'
    plan_table_unordered = True
    plan_index_info_shape = 4

    plan_features_on_cuda = False
    plan_explain_use_partial_plan = True
    plan_explain_use_cache = True
    plan_explain_use_asyncio = False

    topk_explore_prob_coef = 0.3
    topk_explore_lambda = 2.0

    extractor_use_transformer = True
    extractor_num_table_layers = 3
    extractor_autoencoder_attr_size = 3
    extractor_use_autoencoder = True
    extractor_use_normalization = True
    extractor_use_no_gat = False
    extractor_remove_table_to_table_edges = True
    extractor_use_table_emb_from_epoch = 16.
    extractor_table_emb_dropout = 1 / 3
    extractor_hidden_size = 128
    extractor_embedding_rank = 0 # use embedding size // 8

    transformer_hidden_size = 192
    transformer_attention_heads = 8
    transformer_fc_dropout_rate = 0.1
    transformer_attention_dropout_rate = 0.1
    transformer_attention_layers = 6
    transformer_attention_dropout_until_epoch = None
    transformer_norm_type = 'rms'#'layer'

    transformer_moe_num_experts = None
    transformer_moe_num_selected_experts = None
    transformer_moe_exploration_mode = 'egreedy'
    transformer_moe_softmax_temperature = 1.
    transformer_moe_epsilon = 0.25
    transformer_moe_weight_thres = 0.1
    transformer_moe_hidden_size = None

    transformer_use_height = True
    transformer_relative_dist_maximum = 8
    transformer_super_node_height = True
    transformer_super_node_link_to_root_nodes_only = False
    transformer_link_to_super_node = True
    # none, dist, height, dist_different
    transformer_super_node_relative_dist_bias_type = 'height'
    # batch, layer
    transformer_node_attrs_preprocess_norm_type = 'batch'
    # none, completed, all
    transformer_node_attrs_preprocess_zscore = 'all'
    transformer_encoder_weight = 0.1
    transformer_cls_extractor_grad = True
    transformer_reg_extractor_grad = True
    transformer_use_two_submodels = True

    rl_initial_exploration_prob = 0.8
    rl_reward_weighting = 0.1
    rl_sample_weighting_exponent = 0.0
    rl_use_ranking_loss = True
    rl_ranking_loss_start_epoch = 8
    rl_use_complementary_loss = True
    rl_complementary_loss_equal_suppress = 0
    rl_use_other_states = True
    rl_ranking_loss_weight = 0.2
    rl_complementary_loss_weight = 0.2
    rl_use_grad_clip = True
    rl_grad_clip_ratio = 1.0
    rl_early_stop_prob = 0.2
    rl_use_baseline_as_a_path = True
    rl_use_self_imitation = True
    rl_self_imitation_weight = 0.5
    rl_offline_samples_suppress_outliers_quantile = 0.8
    rl_offline_samples_suppress_start_epoch = 8
    rl_regression_loss_weight = 1.
    rl_classification_loss_weight = 1.
    rl_recent_cache_capacity = 50
    rl_recent_cache_use_best = False
    rl_classification_loss_use_recent = False
    rl_regression_loss_use_recent = False
    rl_no_classification_loss = False

    classification_max_log_value = 6.
    classification_min_log_value = 0.
    classification_num_classes = 24
    classification_normal_std = 0.125
    classification_softmax_temperature = 1 / 10
    classification_use_kl_ranking_loss = False
    classification_window_size = 6
    classification_confidence_prob = 0.9
    classification_use_window_max = False
    classification_tolerance_thres = 0.25 # 10 ** x
    classification_prob_compress_half_size = 3#4
    classification_bushy_std = 0.5
    classification_compare_mode = 'exp'  # 'integral'
    rl_search_use_classification = False

    lora_rank = 8
    lora_alpha = 1.
    use_lora_only = False
    lora_finetuning_extractor_start_epoch = 16#None
    lora_finetuning_transformer_start_epoch = 0
    lora_settings = (
        {'epoch': 4, 'rank': 8, 'model': {'extractor': True, 'transformer': False}},
    )

    predict_use_relative = 'none' # none, base, best
    epochs = 200
    epoch_parameter_reset_start_epoch = 8
    epoch_parameter_reset_interval = None
    epoch_low_timeout_limit = 8
    epoch_cache_auto_drop_timeout_interval = 8#None
    validate_with_training_dataset = True
    learning_rate = 3e-4
    batch_size = 128
    sql_timeout_limit = 4
    bushy = True
    bushy_start_epoch = 4
    # when the best plan has N bushy nodes, bushy explorations that make bushy level exceeds N will be suppressed
    bushy_suppress_ratio = 0.75
    beam_width = 4
    priority_memory_ratio = 0#0.125
    priority_memory_start_epoch = 16
    memory_size = 10000000
    validate_start = 0
    validate_interval = 4
    save_checkpoint_interval = 4
    max_initial_experience_queries = 200
    backward_times = ((0, 1), (8, 2), (16, 3))
    scheduler_info = {
        'type': 'MultiStepLR',
        'args': {
            'milestones': [*range(50, 150, 2),],
            'gamma': 0.1 ** (1 / 50),
        },
    }
    optimizer_info = {
        'type': 'Adam',
        'args': {
            'weight_decay': 0.,
        }
    }
    regularization_use_on_bias = True
    regularization_info = None
    regularization_weight = 0
    regularization_norm_type = 1

    resample_weight_cap = (0.5, 2)
    resample_mode = 'augment'
    resample_start_epoch = 10
    resample_alpha = 0.2
    resample_interval = 1
    resample_count = 0
    resample_count_extra_datasets = 0
    use_worst_training_sql_ratio = 0.05
    use_worst_training_sql_use_relative = False
    use_worst_training_sql_relative_latency_cap = 3.0
    use_worst_training_sql_augmentation_ratio = None

    ignore_testing_set_leakage = False

    load_random_state = True
    path_checkpoints = 'checkpoints'
    path_results = 'results'
    config_file_name = 'checkpoints/config_{}.txt'
    checkpoint_file_name = '{}.checkpoint.pkl'
    cache_type = 'postgres' # 'file'
    cache_file_name = 'cache.pkl'
    cache_table_name = 'cache'
    log_name = 'DivQO'
    log_file_name = 'log/{}.log'
    log_debug = True
    cache_save_interval = 400
    save_checkpoint_as_folder = True
    save_epoch_checkpoints = True
    save_epoch_checkpoints_interval = 8

    history_rearrange_mode = 'shuffle'

    experiment_id = '(default)'
    # automatically send experiment results to the receiver account
    email = None
    email_password = None
    email_receiver = None
    email_product_name = 'DivQO'
    auto_notify_interval = 60 * 60
    seed = 0

    sql_homo_graph_debug = True

    # custom settings
    resample_mode = 'sample'
    resample_start_epoch = 0
    resample_count = 200
    resample_count_extra_datasets = 50
    #priority_memory_ratio = 0.
    feature_size = 256
    embedding_size = 256
    max_sequence_length = 48
    transformer_hidden_size = 512
    backward_times = ((0, 1), (8, 2), (16, 3))
    rl_use_grad_clip = False
    rl_grad_clip_ratio = 1.0
    lora_finetuning_extractor_start_epoch = 50
    lora_finetuning_transformer_start_epoch = 4
    resample_interval = 1
    rl_use_self_imitation = True
    extractor_use_table_emb_from_epoch = 16.
    save_checkpoint_interval = 4
    save_epoch_checkpoints_interval = 4

    rl_use_ranking_loss = False
    rl_use_complementary_loss = False
    feature_size = 512
    extractor_hidden_size = 128
    transformer_hidden_size = 1024
    lora_rank = 8
    lora_settings = (
        {'epoch': 0, 'rank': 8, 'model': {'extractor': False, 'transformer': False}},
        {'epoch': 8, 'rank': 32, 'model': {'extractor': True, 'transformer': False}},
        {'epoch': 16, 'rank': 8, 'model': {'extractor': True, 'transformer': False}},
        {'epoch': 32, 'rank': 8, 'model': {'extractor': True, 'transformer': True}},
    )
    learning_rate = 3e-5
    scheduler_info = {
        'type': 'MultiStepConstantLR',
        'args': {
            'milestones': [8, 16, 32],
            'gammas': [1., 1., 0.5, 1. / 3],
        },
    }
    optimizer_info = {
        'type': 'AdamW',
        'args': {
            'weight_decay': 0.,
        }
    }

    epochs = 60
    bushy_suppress_ratio = 0.5
    classification_bushy_std = 0.25
    feature_size = 512
    embedding_size = 512
    extractor_hidden_size = 128
    transformer_hidden_size = 1024

    #transformer_hidden_size = 512
    #transformer_moe_num_experts = 5
    #transformer_moe_num_selected_experts = 2
    transformer_moe_exploration_mode = 'egreedy'
    transformer_moe_softmax_temperature = 1.
    transformer_moe_epsilon = 0.25
    transformer_moe_weight_thres = 0.1
    # experience collecting
    #feature_size = 64
    #transformer_hidden_size = 192
    #lora_finetuning_extractor_start_epoch = 16
    #resample_interval = 1

    #rl_classification_loss_weight = 0.

    extractor_use_table_emb_from_epoch = 16.
    transformer_cls_extractor_grad = True
    transformer_reg_extractor_grad = True

    transformer_use_two_submodels = True

    rl_no_classification_loss = False

    transformer_encoder_weight = 0.
    rl_use_baseline_as_a_path = True
    batch_size = 128
    feature_size = 512
    embedding_size = 128
    extractor_hidden_size = 512
    transformer_hidden_size = 1024
    transformer_attention_layers = 4
    extractor_num_table_layers = 2
    extractor_embedding_rank = None
    rl_search_use_classification = False
    lora_settings = (
        {'epoch': 0, 'rank': 8, 'model': {'extractor': False, 'transformer': False}},
        #{'epoch': 8, 'rank': 256, 'model': {'extractor': True, 'transformer': False}},
        #{'epoch': 16, 'rank': 64, 'model': {'extractor': True, 'transformer': False}},
        #{'epoch': 32, 'rank': 32, 'model': {'extractor': True, 'transformer': True}},
        #{'epoch': 8, 'rank': 64, 'model': {'extractor': True, 'transformer': False}},
        #{'epoch': 16, 'rank': 64, 'model': {'extractor': True, 'transformer': False}},
        #{'epoch': 32, 'rank': 16, 'model': {'extractor': True, 'transformer': True}},
    )
    optimizer_info = {
        'type': 'AdamW',
        'args': {
            'weight_decay': 1e-2,
        }
    }
    regularization_info = (
        {'epoch': 0, 'info': (
            #{'norm': 1, 'weight': 1e-5},
        )},
        {'epoch': 16, 'info': ()},
    )
    #transformer_moe_num_experts = 5
    #transformer_moe_num_selected_experts = 2
    #transformer_moe_hidden_size = (1024, 512, 256, 256, 256)

    eraser_comparator_default_confidence = 0.5
    eraser_comparator_confidence_thres = 0.8
    eraser_predictor_qerror_thres = 0.5
