@testset "Scc" begin
    @testset "Construct" begin
        g = SccGraph(4)
        add_dir_edge!(g, 1, 2)
        add_dir_edge!(g, 2, 3)
        add_dir_edge!(g, 3, 4)
        @test g.n == 4
        @test g.edges == [[2], [3], [4], Int64[]]
        @test g.rev_edges == [Int64[], [1], [2], [3]]
        @test scc(g) == [[1], [2], [3], [4]]
    end
end