@testset "Lca" begin
    graph = LcaGraph(8)
    add_undir_edge!(graph, 1, 2)
    add_undir_edge!(graph, 1, 3)
    add_undir_edge!(graph, 2, 4)
    add_undir_edge!(graph, 2, 5)
    add_undir_edge!(graph, 3, 6)
    add_undir_edge!(graph, 5, 7)
    add_undir_edge!(graph, 5, 8)
    lca = Lca(graph, 1)
    @test lca == Lca(
        [
            0 1 1 2 2 3 5 5
            0 0 0 1 1 1 2 2
            0 0 0 0 0 0 0 0
        ],
        [1, 2, 2, 3, 3, 3, 4, 4],
        3,
    )
    @test find_lca(lca, 2, 1) == 1
    @test find_lca(lca, 2, 6) == 1
    @test find_lca(lca, 7, 8) == 5

    @test distance(lca, 4, 3) == 3
end
