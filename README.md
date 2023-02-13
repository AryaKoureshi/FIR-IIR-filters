# FIR-IIR-filters
FIR (Finite Impulse Response) and IIR (Infinite Impulse Response) are two types of filters commonly used in digital signal processing.

FIR filters are characterized by a finite impulse response, meaning that their output is only affected by the current and previous inputs. They are linear and time-invariant systems, which means that their response to a given input does not change over time and is proportional to the input. They are widely used for filtering signals because of their stability and the ability to produce a linear phase response.

IIR filters, on the other hand, have an infinite impulse response, meaning that their output depends on both the current and previous inputs and outputs. They are non-linear systems that can provide more selective filtering than FIR filters, but can also be unstable and have a non-linear phase response. IIR filters are often used in applications where a more complex filter is needed, such as in noise reduction and equalization.

In summary, both FIR and IIR filters have their own strengths and weaknesses, and the choice of filter type depends on the specific requirements of the application.

### Comparison_of_IIR_filters.m:
This MATLAB code creates and plots the frequency response of different types of filters, lowpass, bandpass, and bandstop, using Butterworth, Chebyshev type I, and Chebyshev type II filter design methods. The filters are designed for a cutoff frequency of 10 Hz and a sample rate of 100 Hz. The frequency response of each filter type is plotted with its corresponding filter design method in a separate figure. The x-axis of each plot is the frequency in Hz and the y-axis is the magnitude in dB. The axis limits are set to [0, 50] for the x-axis and [-110, 5] for the y-axis, and the plots are displayed with grid lines.
