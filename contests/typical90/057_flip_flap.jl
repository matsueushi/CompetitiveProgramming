const P = 998244353

function solve(n, m, ts, xss, ss)
    mat = zeros(Int64, n, m)
    for i in 1:n
        for j in 1:ts[i]
            mat[i, xss[i][j]] = 1
        end
    end
    c = 1
    for i in 1:m
        for j in c:n
            if mat[j, i] == 1
                for k in j+1:n
                    if mat[k, i] == 1
                        mat[k, :] .⊻= mat[j, :]
                    end
                end
                if ss[i] == 1
                    ss .⊻= mat[j, :]
                end
                mat[j, :], mat[c, :] = mat[c, :], mat[j, :]
                c += 1
                break
            end
        end
    end
    if iszero(ss)
        c = 1
        for i in 1:n
            if !iszero(mat[i, :])
                c = i
            end
        end
        return powermod(2, n - c, P)
    else
        return 0
    end
end

function main()
    n, m = parse.(Int64, split(readline()))
    ts = zeros(Int64, n)
    xss = Vector{Int64}[]
    for i in 1:n
        ts[i] = parse(Int64, readline())
        push!(xss, parse.(Int64, split(readline())))
    end
    ss = parse.(Int64, split(readline()))
    println(solve(n, m, ts, xss, ss))
end

main()
