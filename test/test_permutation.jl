using CompetitiveProgramming.PermutationModule

@testset "Permutation" begin
    @testset "Basic" begin
        xs = [1, 2, 3]
        @test next_permutation!(xs)
        @test xs == [1, 3, 2]
        @test next_permutation!(xs)
        @test xs == [2, 1, 3]
        @test next_permutation!(xs)
        @test xs == [2, 3, 1]
        @test next_permutation!(xs)
        @test xs == [3, 1, 2]
        @test next_permutation!(xs)
        @test xs == [3, 2, 1]
        @test !next_permutation!(xs)
    end
end