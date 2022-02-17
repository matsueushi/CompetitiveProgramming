function solve(w, n, ls, rs, vs)
    ws = rs .- ls
    dpv = zeros(Int64, n + 1, w + 1)
    dpw = zeros(Int64, n + 1, w + 1)
    for i in 1:n
        li = ls[i]
        wi = ws[i]
        vi = vs[i]
        for j in 0:w
            if j < li || (j > li && dpv[i, 1+j-li] == 0)
                dpv[i+1, 1+j] = dpv[i, 1+j]
                dpw[i+1, 1+j] = dpw[i, 1+j]
            else
                dpv[i+1, 1+j] = max(dpv[i, 1+j], dpv[i, 1+j-li] + vi)
                dpw[i+1, 1+j] = max(dpw[i, 1+j], dpw[i, 1+j-li] + wi)
            end
        end
    end
    v = -1
    for j in 0:w
        if dpv[n+1, 1+j] > 0 && j + dpw[n+1, 1+j] ≥ w
            v = max(v, dpv[n+1, 1+j])
        end
    end
    v
end

function main()
    w, n = parse.(Int64, split(readline()))
    ls = zeros(Int64, n)
    rs = zeros(Int64, n)
    vs = zeros(Int64, n)
    for i in 1:n
        ls[i], rs[i], vs[i] = parse.(Int64, split(readline()))
    end
    println(solve(w, n, ls, rs, vs))
end

main()
