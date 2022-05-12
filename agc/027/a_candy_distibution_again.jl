function solve(n, x, as)
    sort!(as)
    happy = 0
    for i in 1:n
        if x ≥ as[i]
            happy += 1
        end
        x -= min(x, as[i])
        x == 0 && break
    end
    x > 0 && (happy -= 1)
    happy
end

function main()
    n, x = parse.(Int, split(readline()))
    as = parse.(Int, split(readline()))
    println(solve(n, x, as))
end

main()
