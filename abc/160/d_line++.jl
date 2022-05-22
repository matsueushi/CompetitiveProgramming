parseints() = parse.(Int, split(readline()))

function solve(n, x, y)
    dcount = zeros(Int, n - 1)
    for i in 1:n
        for j in i+1:n
            d = min(j - i, abs(i - x) + 1 + abs(j - y))
            dcount[d] += 1
        end
    end
    dcount
end

function main()
    n, x, y = parseints()
    for d in solve(n, x, y)
        println(d)
    end
end

main()
