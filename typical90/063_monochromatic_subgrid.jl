function check(h, w, m, i)
    ok = trues(w)
    num = zeros(Int64, w)
    hsize = 0
    for j in 1:h
        if i & (1 << (j - 1)) != 0
            hsize += 1
            for k in 1:w
                ok[k] || continue
                num[k] == 0 && (num[k] = m[j, k]; continue)
                num[k] != m[j, k] && (ok[k] = false)
            end
        end
    end
    count = Dict{Int64,Int64}()
    wmax = 0
    for k in 1:w
        if ok[k]
            count[num[k]] = get(count, num[k], 0) + 1
            wmax = max(wmax, count[num[k]])
        end
    end
    hsize * wmax
end

function solve(h, w, m)
    res = 0
    for i in 1:1<<h-1
        res = max(res, check(h, w, m, i))
    end
    res
end

function main()
    h, w = parse.(Int64, split(readline()))
    m = zeros(Int64, (h, w))
    for i in 1:h
        m[i, :] = parse.(Int64, split(readline()))
    end
    println(solve(h, w, m))
end

main()
