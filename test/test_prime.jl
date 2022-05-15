using CompetitiveProgramming.PrimeModule

@testset "Prime" begin
    @test sieve(10) == [2, 3, 5, 7]
end