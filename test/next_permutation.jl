@testset "next_permutation" begin
    xs = [1, 2, 3, 4, 5]
    @test next_permutation!(xs) == true
    @test xs == [1, 2, 3, 5, 4]

    xs = [1, 2, 4, 5, 3]
    @test next_permutation!(xs) == true
    @test xs == [1, 2, 5, 3, 4]

    xs = [3, 5, 4, 2, 1]
    @test next_permutation!(xs) == true
    @test xs == [4, 1, 2, 3, 5]

    xs = [5, 4, 3, 2, 1]
    @test next_permutation!(xs) == false
    @test xs == [5, 4, 3, 2, 1]

end
