parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, bs)
    used = falses(n)
    res = zeros(Int, n)
    for i in 1:n
        ind = 0
        next = nothing
        for k in 1:n
            used[k] && continue
            ind += 1
            if ind == bs[k]
                next = k
            end
        end
        isnothing(next) && return nothing
        used[next] = true
        res[i] = bs[next]
    end
    res
end

function main()
    n = parseint()
    bs = parseints()
    res = solve(n, bs)
    if isnothing(res)
        println(-1)
    else
        for x in reverse(res)
            println(x)
        end
    end
end

main()
