function main()
    n, d = parse.(Int, split(readline()))
    x = zeros(Int, n, d)
    for i in 1:n
        x[i, :] = parse.(Int, split(readline()))
    end

    res = 0
    for i in 1:n
        for j in i+1:n
            s = sum((x[i, :] .- x[j, :]) .^ 2)
            sqrts = isqrt(s)
            s == sqrts^2 && (res += 1)
        end
    end
    println(res)
end

main()
