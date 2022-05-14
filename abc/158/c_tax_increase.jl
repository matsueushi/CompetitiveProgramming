const N = 20000

function ftable(r)
    table = zeros(Int, N)
    for i in 1:N
        table[i] = floor(Int, i * r)
    end
    table
end

function solve(a, b)
    c1 = ftable(0.08)
    c2 = ftable(0.1)
    ra = searchsorted(c1, a)
    rb = searchsorted(c2, b)
    a1, a2 = first(ra), last(ra)
    b1, b2 = first(rb), last(rb)
    (a2 < b1 || b2 < a1) && return -1
    max(a1, b1)
end

function main()
    a, b = parse.(Int, split(readline()))
    println(solve(a, b))
end

main()
