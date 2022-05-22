parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, hs)
    for i in n-1:-1:1
        hs[i] > hs[i+1] + 1 && return false
        hs[i] == hs[i+1] + 1 && (hs[i] -= 1)
    end
    true
end

function main()
    n = parseint()
    hs = parseints()
    println(ifelse(solve(n, hs), "Yes", "No"))
end

main()
