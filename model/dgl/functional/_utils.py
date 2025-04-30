import dgl


def copy(graph : dgl.DGLGraph, copy_features=True):
    if graph.is_homogeneous:
        batch_node_info = graph.batch_num_nodes()
        batch_edge_info = graph.batch_num_edges()
        num_nodes = graph.num_nodes()
        edges = graph.edges(form='uv')

        new_graph = dgl.graph(edges, num_nodes=num_nodes, device=graph.device)
        new_graph.set_batch_num_nodes(batch_node_info)
        new_graph.set_batch_num_edges(batch_edge_info)
        if copy_features:
            for typ, value in graph.ndata.items():
                new_graph.ndata[typ] = value.clone()
            for typ, value in graph.edata.items():
                new_graph.edata[typ] = value.clone()
    else:
        node_types, edge_types = graph.ntypes, graph.canonical_etypes
        num_nodes = {}
        edge_info = {}
        batch_node_info = {}
        batch_edge_info = {}
        for typ in node_types:
            batch_node_info[typ] = graph.batch_num_nodes(typ)
            num_nodes = graph.num_nodes(typ)
        for typ in edge_types:
            batch_edge_info[typ] = graph.batch_num_edges(typ)
            edge_info[typ] = graph.edges(form='uv', etype=typ)
        new_graph = dgl.heterograph(edge_info, num_nodes, device=graph.device)
        new_graph.set_batch_num_nodes(batch_node_info)
        new_graph.set_batch_num_edges(batch_edge_info)
        if copy_features:
            for typ in node_types:
                for fname, value in graph.nodes[typ].data.items():
                    new_graph.nodes[typ].data[fname] = value.copy()
            for typ in edge_types:
                for fname, value in graph.edges[typ].data.items():
                    new_graph.edges[typ].data[fname] = value.copy()
    return new_graph


__all__ = ['copy']
