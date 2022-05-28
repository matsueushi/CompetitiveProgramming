# CompetitiveProgramming
競技プログラミングの色々な問題をJuliaで解く

Julia: v1.4.0

- [AtCoder Beginner Contest](abc/)
- [AtCoder Grand Contest](agc/)
- [AtCoder Beginners Selection](abs/)
- [競プロ典型 90 問](typical90/)


# Snippets
```julia
parseint() = parse(Int, readline())
parseints() = parse.(Int, split(readline()))
function parsepoints(n::Int)
    xs, ys = zeros(Int, n), zeros(Int, n)
        for i in 1:n
        xs[i], ys[i] = parseints()
    end
    xs, ys
end

function main()

end

main()
```

```julia
ifelse(solve(), "Yes", "No")
```