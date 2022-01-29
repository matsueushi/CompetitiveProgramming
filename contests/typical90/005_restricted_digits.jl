function rdigits(n, b, cs)
    m = 10^9 + 7
    res = zeros(Int64, b)
    for c in cs
        res[1+c%b] += 1
    end

    nres = zeros(Int64, b)
    for i in 2:n
        for bi in 0:b-1
            for c in cs
                nex = (10 * bi + c) % b
                nres[1+nex] += res[1+bi]
                nres[1+nex] = nres[1+nex] % m
            end
        end
        res = nres
    end
    first(res)
end

function main()
    n, b, k = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    println(rdigits(n, b, cs))
end

# main()
for i in 1:5
    @time rdigits(10^i, 957, [1, 2, 3, 5, 6, 7, 9])
end