parseint() = parse(Int, readline())

function solve(n, as)
    for i in 1:n
        isodd(as[i]) && return true
    end
    false
end

function main()
    n = parseint()
    as = zeros(Int, n)
    for i in 1:n
        as[i] = parseint()
    end
    ifelse(solve(n, as), "first", "second") |> println
end

main()
