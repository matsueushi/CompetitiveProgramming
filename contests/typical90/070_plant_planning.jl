function solve(n, xs, ys)
    sort!(xs)
    sort!(ys)
    x = xs[(n+1)÷2]
    y = ys[(n+1)÷2]
    sum(abs.(xs .- x)) + sum(abs.(ys .- y))
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(solve(n, xs, ys))
end

main()
