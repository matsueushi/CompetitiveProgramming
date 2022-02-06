@testset "RangeMinimumQuery" begin
    imax = typemax(Int64)
    @testset "constructor" begin
        q = RangeMinimumQuery([5, 3, 7, 9, 6, 4, 1, 2])
        @test q.rmq == [1, 3, 1, 3, 7, 4, 1, 5, 3, 7, 9, 6, 4, 1, 2]
        @test query(q, 1, 1) == 5
        @test query(q, 1, 3) == 3
        @test query(q, 4, 6) == 4
    end

    @testset "update" begin
        q = RangeMinimumQuery{Int64}(3)
        @test q.n == 3
        @test q.m == 4
        @test_throws ArgumentError update!(q, -1, 1)
        @test_throws ArgumentError update!(q, 4, 1)
        update!(q, 1, 1)
        @test q.rmq == [0, 0, 0, 1, 0, 0, imax]
        update!(q, 3, 3)
        @test q.rmq == [0, 0, 3, 1, 0, 3, imax]
    end
end
