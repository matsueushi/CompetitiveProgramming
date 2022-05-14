function solve(n, as)
    ind = 0
    for a in as
        if a == ind + 1
            ind = a
        end
    end
    ind == 0 ? -1 : n - ind
end

function main()
    n = parse(Int, readline())
    as = parse.(Int, split(readline()))
    println(solve(n, as))
end

main()
