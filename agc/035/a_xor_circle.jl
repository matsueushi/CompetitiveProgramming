parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    d = Dict{Int,Int}()
    for a in as
        d[a] = get(d, a, 0) + 1
    end
    ns = d |> keys |> collect |> sort
    if length(ns) == 1
        only(ns) == 0
    elseif length(ns) == 2
        ns[1] == 0 && d[ns[2]] == 2 * d[0]
    elseif length(ns) == 3
        a, b, c = ns
        d[a] == d[b] == d[c] && a ⊻ b == c
    else
        false
    end
end

function main()
    n = parseint()
    as = parseints()
    println(ifelse(solve(n, as), "Yes", "No"))
end

main()
