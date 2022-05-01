function solve(n, m, a)
    wins = zeros(Int, 2 * n)
    rk = collect(1:2*n)
    for i in 1:m
        for k in 1:n
            p0, p1 = rk[2*k-1], rk[2*k]
            h0, h1 = a[p0][i], a[p1][i]
            if h0 == h1
                continue
            elseif (h0 == 'G' && h1 == 'C') || (h0 == 'C' && h1 == 'P') || (h0 == 'P' && h1 == 'G')
                wins[p0] += 1
            else
                wins[p1] += 1
            end
        end
        tmp = sort!([(-wins[i], i) for i in 1:2*n])
        rk = [i for (w, i) in tmp]
    end
    rk
end

function main()
    n, m = parse.(Int, split(readline()))
    a = String[]
    for i in 1:2*n
        push!(a, readline())
    end
    println(join(solve(n, m, a), "\n"))
end

main()
