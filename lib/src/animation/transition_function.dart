part of dartrocket;

//### StageXL: Simplified BSD License
//
//Copyright (c) 2012, Bernhard Pichler
//All rights reserved.
//
//Redistribution and use in source and binary forms, with or without
//modification, are permitted provided that the following conditions are met:
//
//* Redistributions of source code must retain the above copyright notice,
//  this list of conditions and the following disclaimer.
//* Redistributions in binary form must reproduce the above copyright notice,
//  this list of conditions and the following disclaimer in the documentation
//  and/or other materials provided with the distribution.
//
//THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
//IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
//ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
//LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
//CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
//SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
//BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER
//IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
//ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
//POSSIBILITY OF SUCH DAMAGE.



/**
 * The EaseFunction is the function signature for transitions
 * used in the [Tween] and [Transition] classes. The function
 * takes the ration between 0.0 and 1.0 and returns the actual
 * progress of the transition.
 *
 * See also: [TransitionFunction], [Tween], [Transition]
 *
 * Examples:
 *
 *     // a linear transition
 *     var transition = (ratio) => ratio;
 *
 *     // a quadratic transtion
 *     var transition = (ratio) => ratio * ratio;
 *
 */

typedef num EaseFunction(num ratio);

/**
 * The [TransitionFunction] class provides common transition functions used by
 * the [Transition] and [Tween] classes. The signature of those functions is
 * declared in [EaseFunction].
 *
 * Overview of all available transition types:
 *   <http://www.stagexl.org/docs/transitions.html>
 *
 */

class TransitionFunction {

  // Standard

  Random _random = new Random();

  num linear(num ratio) {
    return ratio;
  }

  num sine(num ratio) {
    return 0.5 - 0.5 * cos(ratio * 2.0 * PI);
  }

  num cosine(num ratio) {
    return 0.5 + 0.5 * cos(ratio * 2.0 * PI);
  }

  num random(num ratio) {
    if (ratio == 0.0 || ratio == 1.0) return ratio;
    return _random.nextDouble();
  }

  EaseFunction custom(num amount) {
    if (amount < -1) amount = -1;
    if (amount > 1) amount = 1;

    num easing(num t) {
      if (amount == 0) return t;
      if (amount < 0) return t * (t * -amount + 1 + amount);
      return t * ((2 - t) * amount + (1 - amount));
    }
    return easing;
  }

  // Quadratic

  num easeInQuadratic(num ratio) {
    return ratio * ratio;
  }

  num easeOutQuadratic(num ratio) {
    ratio = 1.0 - ratio;
    return 1.0 - ratio * ratio;
  }

  num easeInOutQuadratic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInQuadratic(ratio) : 0.5 *
        easeOutQuadratic(ratio - 1.0) + 0.5;
  }

  num easeOutInQuadratic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutQuadratic(ratio) : 0.5 *
        easeInQuadratic(ratio - 1.0) + 0.5;
  }

  // Cubic

  num easeInCubic(num ratio) {
    return ratio * ratio * ratio;
  }

  num easeOutCubic(num ratio) {
    ratio = 1.0 - ratio;
    return 1.0 - ratio * ratio * ratio;
  }

  num easeInOutCubic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInCubic(ratio) : 0.5 * easeOutCubic(ratio -
        1.0) + 0.5;
  }

  num easeOutInCubic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutCubic(ratio) : 0.5 * easeInCubic(ratio -
        1.0) + 0.5;
  }

  // Quartic

  num easeInQuartic(num ratio) {
    return ratio * ratio * ratio * ratio;
  }

  num easeOutQuartic(num ratio) {
    ratio = 1.0 - ratio;
    return 1.0 - ratio * ratio * ratio * ratio;
  }

  num easeInOutQuartic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInQuartic(ratio) : 0.5 * easeOutQuartic(
        ratio - 1.0) + 0.5;
  }

  num easeOutInQuartic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutQuartic(ratio) : 0.5 * easeInQuartic(
        ratio - 1.0) + 0.5;
  }

  // Quintic

  num easeInQuintic(num ratio) {
    return ratio * ratio * ratio * ratio * ratio;
  }

  num easeOutQuintic(num ratio) {
    ratio = 1.0 - ratio;
    return 1.0 - ratio * ratio * ratio * ratio * ratio;
  }

  num easeInOutQuintic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInQuintic(ratio) : 0.5 * easeOutQuintic(
        ratio - 1.0) + 0.5;
  }

  num easeOutInQuintic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutQuintic(ratio) : 0.5 * easeInQuintic(
        ratio - 1.0) + 0.5;
  }

  // Circular

  num easeInCircular(num ratio) {
    return 1.0 - sqrt(1.0 - ratio * ratio);
  }

  num easeOutCircular(num ratio) {
    ratio = 1.0 - ratio;
    return sqrt(1.0 - ratio * ratio);
  }

  num easeInOutCircular(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInCircular(ratio) : 0.5 * easeOutCircular(
        ratio - 1.0) + 0.5;
  }

  num easeOutInCircular(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutCircular(ratio) : 0.5 * easeInCircular(
        ratio - 1.0) + 0.5;
  }

  // Sine

  num easeInSine(num ratio) {
    return 1.0 - cos(ratio * (PI / 2.0));
  }

  num easeOutSine(num ratio) {
    return sin(ratio * (PI / 2.0));
  }

  num easeInOutSine(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInSine(ratio) : 0.5 * easeOutSine(ratio -
        1.0) + 0.5;
  }

  num easeOutInSine(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutSine(ratio) : 0.5 * easeInSine(ratio -
        1.0) + 0.5;
  }

  // Exponential

  num easeInExponential(num ratio) {
    if (ratio == 0.0) return 0.0;
    return pow(2.0, 10.0 * (ratio - 1.0));
  }

  num easeOutExponential(num ratio) {
    if (ratio == 1.0) return 1.0;
    return 1.0 - pow(2.0, -10.0 * ratio);
  }

  num easeInOutExponential(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInExponential(ratio) : 0.5 *
        easeOutExponential(ratio - 1.0) + 0.5;
  }

  num easeOutInExponential(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutExponential(ratio) : 0.5 *
        easeInExponential(ratio - 1.0) + 0.5;
  }

  // Back

  num easeInBack(num ratio) {
    num s = 1.70158;
    return ratio * ratio * ((s + 1.0) * ratio - s);
  }

  num easeOutBack(num ratio) {
    num s = 1.70158;
    ratio = ratio - 1.0;
    return ratio * ratio * ((s + 1.0) * ratio + s) + 1.0;
  }

  num easeInOutBack(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInBack(ratio) : 0.5 * easeOutBack(ratio -
        1.0) + 0.5;
  }

  num easeOutInBack(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutBack(ratio) : 0.5 * easeInBack(ratio -
        1.0) + 0.5;
  }

  // Elastic

  num easeInElastic(num ratio) {
    if (ratio == 0.0 || ratio == 1.0) return ratio;
    ratio = ratio - 1.0;
    return -pow(2.0, 10.0 * ratio) * sin((ratio - 0.3 / 4.0) * (2.0 * PI) / 0.3
        );
  }

  num easeOutElastic(num ratio) {
    if (ratio == 0.0 || ratio == 1.0) return ratio;
    return pow(2.0, -10.0 * ratio) * sin((ratio - 0.3 / 4.0) * (2.0 * PI) / 0.3)
        + 1;
  }

  num easeInOutElastic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInElastic(ratio) : 0.5 * easeOutElastic(
        ratio - 1.0) + 0.5;
  }

  num easeOutInElastic(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutElastic(ratio) : 0.5 * easeInElastic(
        ratio - 1.0) + 0.5;
  }

  // Bounce

  num easeInBounce(num ratio) {
    return 1.0 - easeOutBounce(1.0 - ratio);
  }

  num easeOutBounce(num ratio) {
    if (ratio < 1 / 2.75) {
      return 7.5625 * ratio * ratio;
    } else if (ratio < 2 / 2.75) {
      ratio = ratio - 1.5 / 2.75;
      return 7.5625 * ratio * ratio + 0.75;
    } else if (ratio < 2.5 / 2.75) {
      ratio = ratio - 2.25 / 2.75;
      return 7.5625 * ratio * ratio + 0.9375;
    } else {
      ratio = ratio - 2.625 / 2.75;
      return 7.5625 * ratio * ratio + 0.984375;
    }
  }

  num easeInOutBounce(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeInBounce(ratio) : 0.5 * easeOutBounce(ratio
        - 1.0) + 0.5;
  }

  num easeOutInBounce(num ratio) {
    ratio = ratio * 2.0;
    return (ratio < 1.0) ? 0.5 * easeOutBounce(ratio) : 0.5 * easeInBounce(ratio
        - 1.0) + 0.5;
  }

}
