@testset "CombinationModule" begin
    @testset "Basic" begin
        pmc = PrimeModCombination(10, 7)
        @test combination(pmc, 3, 2) == 3
        @test combination(pmc, 6, 3) == 6
    end

end
