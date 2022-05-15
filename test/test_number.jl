using CompetitiveProgramming.NumberModule

@testset "Number" begin
    @test reversed_number(1234) == 4321
    @test reversed_number(1000) == 1
end