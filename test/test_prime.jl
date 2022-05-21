using CompetitiveProgramming.PrimeModule

@testset "Prime" begin
    @test sieve(10) == [2, 3, 5, 7]

    @test divisors(49) == [1, 7, 49]
    @test divisors(120) == [1, 2, 3, 4, 5, 6, 8, 10, 12, 15, 20, 24, 30, 40, 60, 120]
end