function solve(n, as)
    ns = Int64[]
    ks = Int64[]
    count = 0
    for a in as
        if isempty(ns) || last(ns) != a
            push!(ns, a)
            push!(ks, 1)
            count += 1
        else
            if last(ks) == a - 1
                pop!(ns)
                pop!(ks)
                count -= a - 1
            else
                ks[end] += 1
                count += 1
            end
        end
        println(count)
    end

end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    solve(n, as)
end

main()
