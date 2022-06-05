parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function n_honests(n, honests, unkinds, i)
    h = 0
    for j in 1:n
        i >> (j - 1) & 1 == 1 || continue
        h += 1
        for k in honests[j]
            i >> (k - 1) & 1 == 1 || return 0
        end
        for k in unkinds[j]
            i >> (k - 1) & 1 == 0 || return 0
        end
    end
    h
end

function solve(n, honests, unkinds)
    res = 0
    for i in 1:1<<n
        res = max(res, n_honests(n, honests, unkinds, i))
    end
    res
end

function main()
    n = parseint()
    honests = [Int[] for _ in 1:n]
    unkinds = [Int[] for _ in 1:n]
    for i in 1:n
        a = parseint()
        for j in 1:a
            x, y = parseints()
            if y == 1
                push!(honests[i], x)
            else
                push!(unkinds[i], x)
            end
        end
    end
    println(solve(n, honests, unkinds))
end

main()
