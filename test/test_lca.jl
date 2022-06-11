@testset "Lca" begin
    graph = [Int[] for i in 1:8]
    push!(graph[1], 2)
    push!(graph[2], 1)
    push!(graph[1], 3)
    push!(graph[3], 1)
    push!(graph[2], 4)
    push!(graph[4], 2)
    push!(graph[2], 5)
    push!(graph[5], 2)
    push!(graph[3], 6)
    push!(graph[6], 3)
    push!(graph[5], 7)
    push!(graph[7], 5)
    push!(graph[5], 8)
    push!(graph[8], 5)
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
