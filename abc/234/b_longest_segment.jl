function main()
    n = parse(Int, readline())
    xs = zeros(Int, n)
    ys = zero(xs)
    for i in 1:n
        xs[i], ys[i] = parse.(Int, split(readline()))
    end
    d = 0
    for i in 1:n
        for j in i+1:n
            d = max(d, sqrt((xs[i] - xs[j])^2 + (ys[i] - ys[j])^2))
        end
    end
    println(d)
end

main()
