@testset "Dijkstra" begin
    g = DijkStraGraph(7)
    add_undir_edge!(g, 1, 2, 2)
    add_undir_edge!(g, 1, 3, 5)
    add_undir_edge!(g, 2, 3, 4)
    add_undir_edge!(g, 2, 4, 6)
    add_undir_edge!(g, 3, 4, 2)
    add_undir_edge!(g, 2, 5, 10)
    add_undir_edge!(g, 4, 6, 1)
    add_undir_edge!(g, 5, 6, 3)
    add_undir_edge!(g, 5, 7, 5)
    add_undir_edge!(g, 6, 7, 9)

    res = dijkstra(g, 1)
    @test res.cost == [0, 2, 5, 7, 11, 8, 16]
    @test res.prev == [-1, 1, 1, 3, 6, 4, 5]
end
