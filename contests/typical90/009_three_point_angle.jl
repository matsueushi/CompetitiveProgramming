function angle(n, xs, ys)
    maxd = 0.0
    for i in 1:n
        ss = vcat(1:i-1, i+1:n)
        ds = atand.(xs[ss] .- xs[i], ys[ss] .- ys[i])
        ids = sortperm(ds)
        ds = ds[ids]

        for j in 1:n-1
            i1 = searchsortedfirst(ds, ds[j] + 180.0)
            maxd = max(maxd, ds[i1-1] - ds[j])
            if i1 != n
                maxd = max(maxd, 360.0 - (ds[i1] - ds[j]))
            end
        end
    end
    maxd
end

function main()
    n = parse(Int64, readline())
    xs = zeros(Int64, n)
    ys = zeros(Int64, n)
    for i in 1:n
        xs[i], ys[i] = parse.(Int64, split(readline()))
    end
    println(angle(n, xs, ys))
end

main()
