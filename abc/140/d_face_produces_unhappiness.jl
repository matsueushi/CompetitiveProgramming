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

function solve(n, k, s)
    pts = 0
    for i in 1:n-1
        s[i] == s[i+1] && (pts += 1)
    end
    chs = n - 1 - pts
    t = min(k, chs >> 1)
    pts += t * 2
    (k - t > 0 && chs - t << 1 == 1) && (pts += 1)
    pts
end

function main()
    n, k = parseints()
    s = readline()
    solve(n, k, s) |> println
end

main()
