@testset "Bridge" begin
    g = BridgeGraph(9)
    add_undir_edge!(g, 1, 3)
    add_undir_edge!(g, 2, 7)
    add_undir_edge!(g, 3, 4)
    add_undir_edge!(g, 4, 5)
    add_undir_edge!(g, 4, 6)
    add_undir_edge!(g, 5, 6)
    add_undir_edge!(g, 6, 7)
    @test find_bridges(g, 4) == Set([3 => 1, 4 => 3, 7 => 2, 6 => 7])
end
