using CompetitiveProgramming.FenwickTreeModule

@testset "Fenwick Tree" begin
    @testset "Basic" begin
        fw = FenwickTree{Int64}(10)
        add!(fw, 2, 4)
        @test partialsum(fw, 1:1) == 0
        @test partialsum(fw, 1:2) == 4
        @test partialsum(fw, 1:3) == 4
        @test partialsum(fw, 2:3) == 4
        @test partialsum(fw, 2:4) == 4
        @test partialsum(fw, 3:4) == 0
        @test partialsum(fw, 5:4) == 0
    end

    @testset "Naive" begin
        for n in 1:50
            fw = FenwickTree{Int64}(n)
            for i in 1:n
                add!(fw, i, i^2)
            end
            for l = 1:n
                for r in l:n
                    s = 0
                    for i in l:r
                        s += i^2
                    end
                    @test partialsum(fw, l:r) == s
                end
            end
        end
    end

    @testset "Invalid" begin
        @test_throws ArgumentError FenwickTree{Int64}(-1)
        fw = FenwickTree{Int64}(10)
        @test_throws BoundsError add!(fw, 0, 0)
        @test_throws BoundsError add!(fw, 11, 0)
        @test_throws BoundsError partialsum(fw, -1:1)
        @test_throws BoundsError partialsum(fw, 5:11)
    end
end