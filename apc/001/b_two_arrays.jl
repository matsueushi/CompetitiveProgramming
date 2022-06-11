parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, as, bs)
    cs = as .- bs
    s = 0
    v = 0
    for i in 1:n
        if cs[i] > 0
            s += cs[i]
        else
            v += (-cs[i]) >> 1
        end
    end
    s ≤ v
end

function main()
    n = parseint()
    as = parseints()
    bs = parseints()
    println(ifelse(solve(n, as, bs), "Yes", "No"))
end

main()
