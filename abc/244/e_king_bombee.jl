const P = 998244353

function solve(n, m, k, s, t, x, us, vs)
    c = zeros(Int, k + 1, n, 2)
    c[1, s, 2] = 1
    for i in 1:k
        for j in 1:m
            for b in 0:1
                c[i+1, vs[j], b⊻(vs[j]==x)+1] += c[i, us[j], b+1]
                c[i+1, vs[j], b⊻(vs[j]==x)+1] %= P
                c[i+1, us[j], b⊻(us[j]==x)+1] += c[i, vs[j], b+1]
                c[i+1, us[j], b⊻(us[j]==x)+1] %= P
            end
        end
    end
    c[k+1, t, 2]
end

function main()
    n, m, k, s, t, x = parse.(Int, split(readline()))
    us, vs = zeros(Int, m), zeros(Int, m)
    for i in 1:m
        us[i], vs[i] = parse.(Int, split(readline()))
    end
    println(solve(n, m, k, s, t, x, us, vs))
end

main()
