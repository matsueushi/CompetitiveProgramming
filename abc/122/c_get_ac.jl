parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
    for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end
function parsestrings(n)
    ss = Vector{String}(undef, n)
    for i in 1:n
        ss[i] = readline()
    end
    ss
end

function solve(n, q, s, ls, rs)
    acs = zeros(Int, n)
    ac = 0
    for i in 2:n
        s[i-1:i] == "AC" && (ac += 1)
        acs[i] = ac
    end
    res = zeros(Int, q)
    for i in 1:q
        res[i] = acs[rs[i]] - acs[ls[i]]
    end
    res
end

function main()
    n, q = parseints()
    s = readline()
    ls, rs = parsepoints(q)
    for x in solve(n, q, s, ls, rs)
        println(x)
    end
end

main()
