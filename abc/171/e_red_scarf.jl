parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    a = reduce(⊻, as; init=0)
    as .⊻ a
end

function main()
    n = parseint()
    as = parseints()
    for x in solve(n, as)
        println(x)
    end
end

main()
