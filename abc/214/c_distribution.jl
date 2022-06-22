parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))

function solve(n, ss, ts)
    cs = copy(ts)
    vs = collect(enumerate(ts))
    while !isempty(vs)
        i, v = pop!(vs)
        cs[i] = min(cs[i], v)
        if i == n
            v + ss[n] < cs[1] && (push!(vs, (1, v + ss[n])))
        else
            v + ss[i] < cs[i+1] && (push!(vs, (i + 1, v + ss[i])))
        end
    end
    cs
end

function main()
    n = parseint()
    ss = parseints()
    ts = parseints()
    for x in solve(n, ss, ts)
        println(x)
    end
end

main()
