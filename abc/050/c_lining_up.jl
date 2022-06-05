parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const P = 10^9 + 7

function solve(n, as)
    cs = zeros(Int, n)
    for i in 1:n
        cs[as[i]+1] += 1
    end
    if iseven(n)
        for x in 1:2:n-1
            cs[x+1] == 2 || return 0
        end
    else
        cs[1] == 1 || return 0
        for x in 2:2:n-1
            cs[x+1] == 2 || return 0
        end
    end
    powermod(2, n >> 1, P)
end

function main()
    n = parseint()
    as = parseints()
    println(solve(n, as))
end

main()
