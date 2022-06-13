parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    ct = Dict{Int,Int}()
    for a in as
        ct[a] = get(ct, a, 0) + 1
    end
    r = 0
    for x in values(ct)
        r += x - 1
    end
    n - 2 * cld(r, 2)
end

function main()
    n = parseint()
    as = parseints()
    solve(n, as) |> println
end

main()
