function solve(n, m, as, cs)
    bs = zeros(Int64, m + 1)
    for i in Iterators.reverse(0:m)
        cs[n+i+1] == 0 && continue
        b = bs[i+1] = cs[n+i+1] ÷ as[n+1]
        for j in 0:n
            cs[i+j+1] -= b * as[j+1]
        end
    end
    bs
end

function main()
    n, m = parse.(Int64, split(readline()))
    as = parse.(Int64, split(readline()))
    cs = parse.(Int64, split(readline()))
    println(join(solve(n, m, as, cs), " "))
end

main()
