function solve(n, k, xs)
    rnds = fill(-1, n + 1)
    rnds[1] = 0
    ns = zeros(Int, n + 1)
    c = 0
    for i in 1:k
        c = c + xs[c%n+1]
        cmod = c % n + 1
        if rnds[cmod] < 0
            rnds[cmod] = i
            ns[cmod] = c
        else
            st_rnd = rnds[cmod]
            st_ns = ns[cmod]
            cycle = i - st_rnd
            incr = c - st_ns
            n_cycle = (k - st_rnd) ÷ cycle
            en_rnd = st_rnd + n_cycle * cycle
            c = st_ns + n_cycle * incr
            for j in en_rnd+1:k
                c = c + xs[c%n+1]
            end
            return c
        end
    end
    c
end

function main()
    n, k = parse.(Int, split(readline()))
    xs = parse.(Int, split(readline()))
    println(solve(n, k, xs))
end

main()
