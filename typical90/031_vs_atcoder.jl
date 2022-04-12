function grundy(w, b)
    bsize = b + w * (w + 1) ÷ 2
    table = fill(-1, w + 1, bsize + 1)
    jmax = bsize
    for i in 0:w
        jmax -= i
        for j in 0:jmax
            s = Set{Int64}()

            i ≥ 1 && push!(s, table[1+i-1, 1+j+i])
            if j ≥ 2
                for k in 1:j÷2
                    push!(s, table[1+i, 1+j-k])
                end
            end

            g = 0
            while g in s
                g += 1
            end
            table[1+i, 1+j] = g
        end
    end
    table
end

function solve(n, ws, bs)
    wmax = maximum(ws)
    bmax = maximum(bs)
    g = grundy(wmax, bmax)
    x = 0
    for (w, b) in zip(ws, bs)
        x ⊻= g[1+w, 1+b]
    end
    x != 0 ? "First" : "Second"
end

function main()
    n = parse(Int64, readline())
    ws = parse.(Int64, split(readline()))
    bs = parse.(Int64, split(readline()))
    println(solve(n, ws, bs))
end

main()
