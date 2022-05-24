parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

const HMAX = 100

function solve(n, hs)
    cost = 0
    for h in 1:HMAX
        state = false
        for i in 1:n
            if state != (hs[i] ≥ h)
                state = !state
                state && (cost += 1)
            end
        end
    end
    cost
end

function main()
    n = parseint()
    hs = parseints()
    println(solve(n, hs))
end

main()
