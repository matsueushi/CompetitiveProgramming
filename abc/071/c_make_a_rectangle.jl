parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as)
    sort!(as, rev=true)
    s = 1
    p = 0
    b = 0
    for i in 1:n
        if as[i] == b
            p += 1
            s *= b
            b = 0
        else
            b = as[i]
        end
        p == 2 && return s
    end
    0
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
