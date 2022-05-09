using ProgrammingChallenges.DisjointSetModule

@testset "Disjoint Set" begin
    @testset "Basic" begin
        d = DisjointSet(2)
        @test in_same_set(d, 1, 1)
        @test !in_same_set(d, 1, 2)
        @test union!(d, 1, 2) == 1
        @test find_root!(d, 2) == 1
        @test group_size(d, 2) == 2
    end

    @testset "Line" begin
        n = 500000
        d = DisjointSet(n)
        for i in 1:n-1
            union!(d, i, i + 1)
        end
        @test group_size(d, 1) == n
    end

    @testset "Inverse Line" begin
        n = 500000
        d = DisjointSet(n)
        for i in Iterators.reverse(1:n-1)
            union!(d, i, i + 1)
        end
        @test group_size(d, 1) == n
    end
end