parseint() = parse(Int, readline())

function solve(n, s)
    xs = zeros(Int, n)
    for i in 1:length(s)
        xs[i] = ifelse(s[i] == '(', -1, 1)
    end
    cs = cumsum(xs)
    m = max(0, maximum(cs))
    l = last(cs) - m
    '('^m * s * ')'^abs(l)
end

function main()
    n = parseint()
    s = readline()
    println(solve(n, s))
end

main()
